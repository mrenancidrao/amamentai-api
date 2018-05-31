package com.example.amamentai.api.resource;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.repository.ConfiguracaoRepository;
import com.example.amamentai.api.service.DoadoraService;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@RestController
@RequestMapping("/relatorio")
public class RelatorioResource {
	
	public static final String PATH_REPORT = "/reports/";
	public static final String PATH_SUB_REPORT = "/reports/";
	
	
	@Autowired
	ConfiguracaoRepository configuracaoRepository;
	
	@Autowired
	private DoadoraService doadoraService;
	
    @Value("${spring.datasource.url}")
	private String urlConnection;
    
    @Value("${spring.datasource.username}")
	private String usernameConnection;
    
    @Value("${spring.datasource.password}")
	private String passwordConnection;
    
    @Value("${amamentai.profileAtivo}")
  	private String profileAtivo;
    
	
    @GetMapping("/doadoras")
    @PreAuthorize("hasAuthority('ROLE_LISTAR_PESSOA') and #oauth2.hasScope('read')")
    public @ResponseBody void doadoras(HttpServletResponse response) {
	    try {
	    	InputStream jasperStream = this.getClass().getResourceAsStream("/reports/report1.jrxml");
			JasperDesign design = JRXmlLoader.load(jasperStream);
			JasperReport report = JasperCompileManager.compileReport(design);
			
			Map<String, Object> parameterMap = new HashMap();
			
			List<Doadora> doadora = doadoraService.buscarTodas();
			JRDataSource jRDataSource = new JRBeanCollectionDataSource(doadora);
			
			parameterMap.put("datasource", jRDataSource);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, jRDataSource);
			response.setContentType("application/x-pdf");
			response.setHeader("Content-Disposition", "inline: doadoras.pdf");
			
			final OutputStream outputStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    @PostMapping("/agenda")
    @PreAuthorize("hasAuthority('ROLE_LISTAR_PESSOA') and #oauth2.hasScope('read')")
    public @ResponseBody void agenda(HttpServletResponse response, @Valid @RequestBody String dataAgenda) {
	    try {
	    	InputStream jasperStream = this.getClass().getResourceAsStream("/reports/agenda_R.jrxml");
	    	
			JasperDesign design = JRXmlLoader.load(jasperStream);
			JasperReport report = JasperCompileManager.compileReport(design);
			
			Map<String, Object> parameterMap = new HashMap();
			
			parameterMap.put("data", dataAgenda);
			
			if (this.profileAtivo.equals("dev")) {
				parameterMap.put("SUBREPORT_DIR", this.getClass().getResource("/reports/").getPath());
				parameterMap.put("URL_BASE", this.getClass().getResource("/reports/").getPath());
			}
			
			if (this.profileAtivo.equals("prod")) {
				String urlProd = "/app/target/classes/reports/";
				parameterMap.put("SUBREPORT_DIR", urlProd);
				parameterMap.put("URL_BASE", urlProd);
			}
			
			
			
			Connection conn = null;
			
			try {
				conn = DriverManager.getConnection(this.urlConnection,this.usernameConnection,this.passwordConnection);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, conn);
			
			
			response.setContentType("application/x-pdf");
			response.setHeader("Content-Disposition", "inline: doadoras.pdf");
			
			final OutputStream outputStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
			
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
}

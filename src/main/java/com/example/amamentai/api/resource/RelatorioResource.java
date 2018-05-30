package com.example.amamentai.api.resource;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.config.property.AmamentaiApiProperty;
import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.service.DoadoraService;
import com.example.amamentai.api.service.VAgendaService;

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
	
	@Autowired
	private VAgendaService vAgendaService;
	
	@Autowired
	private DoadoraService doadoraService;
	
    
    @GetMapping("/doadoras")
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
    
    @GetMapping("/agenda")
    public @ResponseBody void agenda(HttpServletResponse response) {
	    try {
	    	InputStream jasperStream = this.getClass().getResourceAsStream("/reports/agenda_R.jrxml");
			JasperDesign design = JRXmlLoader.load(jasperStream);
			JasperReport report = JasperCompileManager.compileReport(design);
			
			Map<String, Object> parameterMap = new HashMap();
			
			/*List<VAgenda> agenda = vAgendaService.buscarTodas();
			JRDataSource jRDataSource = new JRBeanCollectionDataSource(agenda);*/
			
			parameterMap.put("data", new Date());

			Connection conn = null;
			
			try {
				conn = DriverManager.getConnection("jdbc:postgresql://localhost/amamentai-api?autoReconnect=true","postgres","postgres");
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

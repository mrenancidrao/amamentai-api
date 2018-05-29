package com.example.amamentai.api.resource;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.service.DoadoraService;
import com.example.amamentai.api.service.IReportService;

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
	private DoadoraService doadoraService;
	
    
    @GetMapping("/doadoras")
    public @ResponseBody void doadoras(HttpServletResponse response) {
	    try {
	    	InputStream jasperStream = this.getClass().getResourceAsStream("/reports/report1.jrxml");
			JasperDesign design = JRXmlLoader.load(jasperStream);
			JasperReport report = JasperCompileManager.compileReport(design);
			
			Map<String, Object> parameterMap = new HashMap();
			
			List<Doadora> doadoras = doadoraService.buscarTodas();
			JRDataSource jRDataSource = new JRBeanCollectionDataSource(doadoras);
			
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
	
}

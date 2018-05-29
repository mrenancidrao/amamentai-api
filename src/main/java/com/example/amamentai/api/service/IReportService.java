package com.example.amamentai.api.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Doadora;


@Service
public class IReportService {

	
    public static ByteArrayInputStream doadorasReport(List<Doadora> doadoras) {

        
        ByteArrayOutputStream out = new ByteArrayOutputStream();


        return new ByteArrayInputStream(out.toByteArray());
    }

}

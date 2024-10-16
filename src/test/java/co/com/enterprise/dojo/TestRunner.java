package co.com.enterprise.dojo;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunner {

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:co/com/enterprise/dojo/features")
                .outputCucumberJson(true)
                .parallel(1); //CON ESTE ES EL QUE DEFINO QUÉ NÚMERO DE THREADS USAN. 4 EN PROMEDIO
        generateReport(results.getReportDir());
        Assertions.assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Rick and Morty API");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
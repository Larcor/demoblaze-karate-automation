package examples.users;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class UsersRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:examples/users")
                .outputCucumberJson(true)
                .tags("~@ignore")
                .parallel(1);

        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        File reportOutputDirectory = new File("build");
        List<String> jsonPaths = new ArrayList<>();
        
        File file = new File(karateOutputPath);
        String[] list = file.list((dir, name) -> name.endsWith(".json"));
        
        if (list != null) {
            for (String json : list) {
                jsonPaths.add(karateOutputPath + File.separator + json);
            }
            
            Configuration config = new Configuration(reportOutputDirectory, "Demoblaze Automation");
            config.addClassifications("Tester", "Manuel Bobadilla");
            config.addClassifications("Tipo", "API");
            config.addClassifications("Environment", "QA");

            ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
            reportBuilder.generateReports();
        }
    }
}
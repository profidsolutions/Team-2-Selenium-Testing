package com.xyzcorp;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.assertj.core.api.Assertions.assertThat;

public class WerkItEmailTest {

    WebDriver driver;

    @BeforeEach
    void setup() {
        driver = WebDriverManager.chromedriver().create();
    }

    @AfterEach
    void teardown() {
        driver.quit();
    }

    @Test
    void testEmailValidationMissingAtSymbol() {
        driver.get("https://staging.tiered-planet.net/werk-it");
        // Find the input text field
        WebElement ele = driver.findElement(By.name("email"));
        // Input test value
        ele.sendKeys("textValue");
        // Validate error message
        JavascriptExecutor js = (JavascriptExecutor) driver;
        Boolean isValidInput = (Boolean) js.executeScript("return arguments[0].checkValidity();", ele);
        System.out.println("OUTPUT:" + isValidInput);
        String validationMessage = (String) js.executeScript("return arguments[0].validationMessage;", ele);
        System.out.println("OUTPUT:" + validationMessage);
        // Assert
        assertThat(isValidInput).isFalse();
        assertThat(validationMessage).contains("is missing an '@'");
    }

    @Test
    void testEmailValidationDomainIncomplete() {
        driver.get("https://staging.tiered-planet.net/werk-it");
        // Find the input text field
        WebElement ele = driver.findElement(By.name("email"));
        // Input test value
        ele.sendKeys("textValue@");
        // Validate error message
        JavascriptExecutor js = (JavascriptExecutor) driver;
        Boolean isValidInput = (Boolean) js.executeScript("return arguments[0].checkValidity();", ele);
        System.out.println("OUTPUT:" + isValidInput);
        String validationMessage = (String) js.executeScript("return arguments[0].validationMessage;", ele);
        System.out.println("OUTPUT:" + validationMessage);
        // Assert
        assertThat(isValidInput).isFalse();
        assertThat(validationMessage).contains("Please enter a part following '@'");
    }

    @Test
    void testEmailValidationLocalIncomplete() {
        driver.get("https://staging.tiered-planet.net/werk-it");
        // Find the input text field
        WebElement ele = driver.findElement(By.name("email"));
        // Input test value
        ele.sendKeys("@someweb.xx");
        // Validate error message
        JavascriptExecutor js = (JavascriptExecutor) driver;
        Boolean isValidInput = (Boolean) js.executeScript("return arguments[0].checkValidity();", ele);
        System.out.println("OUTPUT:" + isValidInput);
        String validationMessage = (String) js.executeScript("return arguments[0].validationMessage;", ele);
        System.out.println("OUTPUT:" + validationMessage);
        // Assert
        assertThat(isValidInput).isFalse();
        assertThat(validationMessage).contains("Please enter a part followed by '@'");
    }

}

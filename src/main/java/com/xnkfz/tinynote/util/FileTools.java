package com.xnkfz.tinynote.util;

import java.nio.file.FileSystems;

public class FileTools {
    public static String getUploadPath(String projectName) {
        String fileSeparator = FileSystems.getDefault().getSeparator();
        return  System.getProperty("user.dir") + fileSeparator + projectName + fileSeparator + "upload" + fileSeparator;
    }
}

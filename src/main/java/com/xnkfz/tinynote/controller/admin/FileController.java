package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xiaoniu
 */
@RestController
@RequestMapping("/admin/file")
public class FileController {
    @Autowired
    private IFileService fileService;
    @PostMapping(value = "upload",consumes = MediaType.MULTIPART_FORM_DATA_VALUE,name = "图片上传")
    public Ajax uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
         return Ajax.success(fileService.uploadFile(file,request));
    }
}

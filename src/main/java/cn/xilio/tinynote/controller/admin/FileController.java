package cn.xilio.tinynote.controller.admin;

import cn.xilio.tinynote.common.Ajax;
import cn.xilio.tinynote.service.IFileService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


/**
 * @author xiaoniu
 */
@RestController
@RequestMapping("/admin/file")
public class FileController {
    @Autowired
    private IFileService fileService;
    @PostMapping(value = "upload",consumes = MediaType.MULTIPART_FORM_DATA_VALUE,name = "文件上传")
    public Ajax uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
         return Ajax.success(fileService.uploadFile(file,request));
    }
}

package com.xnkfz.tinynote.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 晓牛
 */
public interface IFileService {
    /**
     * 文件上传
     *
     * @param file 文件
     * @return 上传后访问地址
     */
    String uploadFile(MultipartFile file, HttpServletRequest request);

}

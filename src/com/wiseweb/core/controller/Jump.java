package com.wiseweb.core.controller;

import org.hyperic.sigar.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ${LiuShuo} on 7/25/2016.
 */
@Controller
@RequestMapping("/one/")
public class Jump {

    @RequestMapping(value = {"two"}, method = RequestMethod.GET)
    public String m1(ModelMap modelMap) throws SigarException {
//        Sigar sigar = new Sigar();
//        Object[] details = getDetails(sigar);
//        modelMap.addAttribute("arr",  details);
        return "/Statistics";
    }

    public  String [] getDetails(org.hyperic.sigar.Sigar sigar) throws SigarException {
//        info = sigar.getCpuInfoList()[0];
        CpuPerc cpuPerc = sigar.getCpuPerc();//cpu使用率
//        timer = sigar.getCpu();
        // 物理内存信息
        Mem mem = sigar.getMem();
// 内存总量
        String totalM = "Total = " + mem.getTotal() / 1024L / 1024 + "M av";
// 当前内存使用量
        String usedM = "Used = " + mem.getUsed() / 1024L / 1024 + "M used";
// 当前内存剩余量
        String freeM = "Free = " + mem.getFree() / 1024L / 1024 + "M free";

// 取硬盘已有的分区及其详细信息（通过sigar.getFileSystemList()来获得FileSystem列表对象，然后对其进行编历
        FileSystem fslist[] = sigar.getFileSystemList();


        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

        String a = "CPU："+cpuPerc.getCombined();
        String b = "内存总量："+totalM;
        String c ="当前内存使用量："+usedM;
        String d ="当前内存剩余量："+freeM;
        String e ="时间："+dateFormat.format(now);

//        System.out.println("CPU："+cpuPerc.getCombined());
//        System.out.println("内存总量："+totalM);
//        System.out.println("当前内存使用量："+usedM);
//        System.out.println("当前内存剩余量："+freeM);
//        System.out.println("时间："+dateFormat.format(now));
        return new String[]{cpuPerc.getCombined()+"",b,c,d,e,"100"};
    }
    @RequestMapping(value = {"four"}, method = RequestMethod.GET)
    public String m4(ModelMap modelMap) throws SigarException {
//        Sigar sigar = new Sigar();
//        Object[] details = getDetails(sigar);
//        modelMap.addAttribute("arr",  details);
        return "/hahaha";
    }
    @RequestMapping(value = {"five"}, method = RequestMethod.GET)
    public String m5(ModelMap modelMap) throws SigarException {
//        Sigar sigar = new Sigar();
//        Object[] details = getDetails(sigar);
//        modelMap.addAttribute("arr",  details);
        return "/five";
    }

    @RequestMapping(value = "cpu.do", method = RequestMethod.GET)
    @ResponseBody
    public String showLine(ModelMap modelMap, HttpSession httpSession) throws Exception{

        Sigar sigar = new Sigar();
        String[] details = getDetails(sigar);
        String cpuInfo = details[0];
        modelMap.addAttribute("arr",  details);
        System.out.println(cpuInfo);
        return cpuInfo;
    }
}
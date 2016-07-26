package sigar;

import org.hyperic.sigar.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ${LiuShuo} on 7/26/2016.
 */
public class Sigars {
//    private Sigar sigar = new Sigar();
    public static void getDetails(org.hyperic.sigar.Sigar sigar) throws SigarException {
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
        System.out.println("CPU："+cpuPerc.getCombined());
        System.out.println("内存总量："+totalM);
        System.out.println("当前内存使用量："+usedM);
        System.out.println("当前内存剩余量："+freeM);
        System.out.println("时间："+dateFormat.format(now));

    }

    public static void main(String[] args) throws SigarException{
        Sigar sigar = new Sigar();
        getDetails(sigar);

    }



}

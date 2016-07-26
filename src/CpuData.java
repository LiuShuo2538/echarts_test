import org.hyperic.sigar.Cpu;
import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.CpuPerc;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;




public class CpuData {


    private CpuInfo info;
    private CpuPerc perc;
    private Cpu timer;

    public CpuData() {
    }

    public void populate(Sigar sigar) throws SigarException {
        info = sigar.getCpuInfoList()[0];
        perc = sigar.getCpuPerc();//cpu使用率
        timer = sigar.getCpu();
    }

    public static CpuData gather(Sigar sigar) throws SigarException {
        CpuData data = new CpuData();
        data.populate(sigar);
        return data;
    }

    public static void main(String[] args) throws Exception {
        Sigar sigar = new Sigar();
        CpuData cpuData = CpuData.gather(sigar);

        System.out.println(cpuData.perc);
    }



}


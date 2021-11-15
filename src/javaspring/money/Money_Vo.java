package javaspring.money;

public class Money_Vo
{
	private int idx;
	private String mid;
	private String mdate;
	private int kumak;
	private String kumak_kubun;
	private String title;
	private String part;
	private String jichul_kubun;
	
	public int getIdx()
	{
		return idx;
	}
	public void setIdx(int idx)
	{
		this.idx = idx;
	}
	public String getMid()
	{
		return mid;
	}
	public void setMid(String mid)
	{
		this.mid = mid;
	}
	public String getMdate()
	{
		return mdate;
	}
	public void setMdate(String mdate)
	{
		this.mdate = mdate;
	}
	public int getKumak()
	{
		return kumak;
	}
	public void setKumak(int kumak)
	{
		this.kumak = kumak;
	}
	public String getKumak_kubun()
	{
		return kumak_kubun;
	}
	public void setKumak_kubun(String kumak_kubun)
	{
		this.kumak_kubun = kumak_kubun;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getPart()
	{
		return part;
	}
	public void setPart(String part)
	{
		this.part = part;
	}
	public String getJichul_kubun()
	{
		return jichul_kubun;
	}
	public void setJichul_kubun(String jichul_kubun)
	{
		this.jichul_kubun = jichul_kubun;
	}
	@Override
	public String toString()
	{
		return "Money_Vo [idx=" + idx + ", mid=" + mid + ", mdate=" + mdate + ", kumak=" + kumak + ", kumak_kubun="
				+ kumak_kubun + ", title=" + title + ", part=" + part + ", jichul_kubun=" + jichul_kubun + "]";
	}
	
	
}

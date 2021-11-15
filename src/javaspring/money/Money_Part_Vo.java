package javaspring.money;

public class Money_Part_Vo
{
	private int idx;
	private String mid;
	private String part_title;
	private String part_kubun;
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
	public String getPart_title()
	{
		return part_title;
	}
	public void setPart_title(String part_title)
	{
		this.part_title = part_title;
	}
	public String getPart_kubun()
	{
		return part_kubun;
	}
	public void setPart_kubun(String part_kubun)
	{
		this.part_kubun = part_kubun;
	}
	@Override
	public String toString()
	{
		return "Money_Part_Vo [idx=" + idx + ", mid=" + mid + ", part_title=" + part_title + ", part_kubun="
				+ part_kubun + "]";
	}
	
}

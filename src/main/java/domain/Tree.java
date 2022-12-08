package domain;

public class Tree {
    private Integer treeNo;
    private String treeNm;
    private String treeInfo;
    private Integer memberNo;

    public Tree(Integer treeNo, String treeNm, String treeInfo, Integer memberNo) {
        this.treeNo = treeNo;
        this.treeNm = treeNm;
        this.treeInfo = treeInfo;
        this.memberNo = memberNo;
    }

    public Tree(String treeNm, String treeInfo) {
        this.treeNm = treeNm;
        this.treeInfo = treeInfo;
    }

    public Tree() {
    }

    public void setTreeNo(Integer treeNo) {
        this.treeNo = treeNo;
    }

    public void setTreeNm(String treeNm) {
        this.treeNm = treeNm;
    }

    public void setTreeInfo(String treeInfo) {
        this.treeInfo = treeInfo;
    }

    public void setMemberNo(Integer memberNo) {
        this.memberNo = memberNo;
    }

    public Integer getTreeNo() {
        return treeNo;
    }

    public String getTreeNm() {
        return treeNm;
    }

    public String getTreeInfo() {
        return treeInfo;
    }

    public Integer getMemberNo() {
        return memberNo;
    }
}

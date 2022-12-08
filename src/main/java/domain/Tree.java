package domain;

public class Tree {
    private Integer treeNo;
    private String treeNm;
    private Integer memberNo;

    public Tree(String treeNm, Integer memberNo) {
        this.treeNm = treeNm;
        this.memberNo = memberNo;
    }

    public Tree(Integer treeNo, String treeNm, Integer memberNo) {
        this.treeNo = treeNo;
        this.treeNm = treeNm;
        this.memberNo = memberNo;
    }

    public Tree(String treeNm) {
        this.treeNm = treeNm;
    }

    public Tree() {
    }

    public Integer getTreeNo() {
        return treeNo;
    }

    public String getTreeNm() {
        return treeNm;
    }

    public Integer getMemberNo() {
        return memberNo;
    }

    public void setTreeNo(Integer treeNo) {
        this.treeNo = treeNo;
    }

    public void setTreeNm(String treeNm) {
        this.treeNm = treeNm;
    }

    public void setMemberNo(Integer memberNo) {
        this.memberNo = memberNo;
    }

}

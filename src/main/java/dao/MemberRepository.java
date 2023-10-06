package dao;
import java.util.*;
import dto.Member;


import java.awt.print.Book;

public class MemberRepository {
    private final ArrayList<Member> members = new ArrayList<>();
    private static final MemberRepository instance = new MemberRepository();

    public static MemberRepository getInstance() {
        return instance;
    }
    public Member getMemberById(String memberId) {
        Member member = null;
        //포이치문 목록순회
        for(Member m : members) {
            if(m.getMemberId().equals(memberId)) {
                //매개변수와 아디가같으면
                member = m;
                break;
            }
        }
        return member;
    }
    public void addMember(Member member) {
        members.add(member);
    }
}

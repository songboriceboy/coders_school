package school.coder.domain;

/**
 * Created by Administrator on 2018/2/21.
 */
public class TopicInfoEx extends TopicInfo {
    private String user_name;
    private String user_avatar;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_avatar() {
        return user_avatar;
    }

    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }
}
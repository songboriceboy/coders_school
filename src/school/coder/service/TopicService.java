package school.coder.service;

import school.coder.domain.TopicInfo;
import school.coder.domain.TopicInfoEx;

import java.util.List;

/**
 * Created by Administrator on 2018/2/19.
 */
public interface TopicService {
    int insertTopic(TopicInfo topicInfo);
    int updateTopic(TopicInfo topicInfo);
    List<TopicInfoEx> getAllTopics();
    TopicInfo getTopicByID(int id);
}

package school.coder.mapper;

import school.coder.domain.TopicInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/2/19.
 */
public interface TopicMapper {
    int insertTopic(TopicInfo topicInfo);
    int updateTopic(TopicInfo topicInfo);
    List<TopicInfo> getAllTopics();
    TopicInfo getTopicByID(int id);
}

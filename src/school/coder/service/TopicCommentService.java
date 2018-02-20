package school.coder.service;

import org.springframework.stereotype.Service;
import school.coder.domain.TopicCommentInfo;

/**
 * Created by Administrator on 2018/2/20.
 */
@Service
public interface TopicCommentService {
    int addComment(TopicCommentInfo topicCommentInfo);
}

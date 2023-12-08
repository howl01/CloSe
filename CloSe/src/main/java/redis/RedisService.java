package redis;

import java.util.Set;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
public class RedisService {

	private RedisTemplate<String, String> redisTemplate;
	
    public RedisService() {
		super();
	}

	public RedisService(RedisTemplate<String, String> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void saveDataToSortedSet(String dataId, int score) {
        redisTemplate.opsForZSet().add("topData", dataId, score);
    }

    public Set<String> getTop10DataFromSortedSet() {
        // 숫자가 높은 상위 10개의 데이터를 가져옴
        return redisTemplate.opsForZSet().reverseRange("topData", 0, 9);
    }
}

require_relative 'test_redis_cache'

describe 'Redis' do
  context 'a result has not been cache' do
    describe 'calling the cached key' do
      it 'returns the value associated with the key' do
        redis = Redis.new
        key = 'name'
        result = redis.cache(key, value='')

        expect(result).to eq nil
      end
    end
  end
end

class RecentCounter
  def initialize
    @requests = []
  end

  def ping(t)
    @requests << t

    # we check that the oldest is within this timeframe. Once we find it, we know that all the
    # rest of the requests in the queue will be up to t time.
    while @requests.first < t-3000
      @request.shift
    end

    return @request.size
  end
end
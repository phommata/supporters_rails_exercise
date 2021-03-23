module Network
  def self.fetch_by_user_id(user_id)
    request_time_ms = Kernel.rand(200).to_f / 1000
    Kernel.sleep(request_time_ms)
    return JSON.parse(File.read(Rails.root.join('app/network-mock.json')))
  end
end

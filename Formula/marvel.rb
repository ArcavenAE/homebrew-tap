class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.063335.92065f0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063335-92065f0/marvel-darwin-arm64"
    sha256 "a0348dab926b501fca7a936c8ee6d7401ad4d8f6fc1cd3a5d83b5a06f88bcb04"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063335-92065f0/marvel-darwin-amd64"
    sha256 "e4f63a09f43851373572cbfb3b74dd87483b95616ee85f8fb5807446ddeb020f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063335-92065f0/marvel-linux-arm64"
    sha256 "f5f6d9e64da2f48a36e433cd1c418a2c4b91711511e8ec6fcea851f31788599a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063335-92065f0/marvel-linux-amd64"
    sha256 "838c37ce2e79e585467daf4f649cf5a3310d12f75383baf65404313ae6243f0f"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end

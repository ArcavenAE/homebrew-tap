class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.004415.b66c204"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-004415-b66c204/marvel-darwin-arm64"
    sha256 "cb99a65204af398b4624b9cc20674809310363266a58ec96c7e2013b6d50d588"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-004415-b66c204/marvel-darwin-amd64"
    sha256 "eba2f5db8b51aa390187216737dc3f731db0618d53d0f46045911c79f5375160"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-004415-b66c204/marvel-linux-arm64"
    sha256 "277a20ead91fbbf0b221e226d09f525f0794997a387e18ec7c12baac8a902023"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-004415-b66c204/marvel-linux-amd64"
    sha256 "ca6f4fb4e5d0bc8fc63553e6fe233ec8831bdff13ace9351d9b56ff61f17d266"
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

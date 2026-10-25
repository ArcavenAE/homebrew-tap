class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.044921.c1ab6ba"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044921-c1ab6ba/marvel-darwin-arm64"
    sha256 "7780d84af57c603da4ac41f78aefd7d7939db200346ce4e75859f04ab0bfb926"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044921-c1ab6ba/marvel-darwin-amd64"
    sha256 "d2ffe7ca32ae5cda9e0c87b9cd5a1df98d85e1dbd6a4bba499e88bc51c725879"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044921-c1ab6ba/marvel-linux-arm64"
    sha256 "b8f3fe08441eee25ef63da1f8e94d9c456cf371be388754500df04b4c4ae9177"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-044921-c1ab6ba/marvel-linux-amd64"
    sha256 "32a5449cce2e36a968849c6a753bd091eeeca658da4f74d5b822454fe9b8fcba"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.063446.ed41d9a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-063446-ed41d9a/marvel-darwin-arm64"
    sha256 "a33f858318ac0714558f0afbb8a2e80995e5ab8b548d9d9e41fd4b53f6fa08bb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-063446-ed41d9a/marvel-darwin-amd64"
    sha256 "36970b03523e676f03fe5357107eb0d48afb4c13c22e7fcb8b9ffb44b72cb81f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-063446-ed41d9a/marvel-linux-arm64"
    sha256 "c5542052b8047d8e23888901edfa7e265c2050e03746aee415cf7fd064edc0fa"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-063446-ed41d9a/marvel-linux-amd64"
    sha256 "4aeb847d025978b258b8618bc584c3efe942791fb50b0156cf5f98cd5cc539c4"
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

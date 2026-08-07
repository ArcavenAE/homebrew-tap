class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.061925.4fe3640"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-061925-4fe3640/marvel-darwin-arm64"
    sha256 "d007159896bbe97d1e55c678dd9fab9024cf88b807f6b1fb0d2923869190abdb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-061925-4fe3640/marvel-darwin-amd64"
    sha256 "ffc86fa743ed15089444581665dc65a58da3c062981fd2852ad0f7f151777d2d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-061925-4fe3640/marvel-linux-arm64"
    sha256 "e307e7c8a5e8a188fd789b5bb64148429af448f69f29ae6ddeaaa16c90e7b023"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-061925-4fe3640/marvel-linux-amd64"
    sha256 "f949e141cbeb0a5f35269782f16dec1b605e5cf3d8debd8731db680d2a241582"
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

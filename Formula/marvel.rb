class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.023445.779d71a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023445-779d71a/marvel-darwin-arm64"
    sha256 "80a43f3e0d6e05838208f5cd25134f41e6292367b87d0519060e14e9628dd82d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023445-779d71a/marvel-darwin-amd64"
    sha256 "6a1953d28d462e9578b1f7b4409d2497f015cf5099afbf7f97a4f76c95e01f95"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023445-779d71a/marvel-linux-arm64"
    sha256 "60be43cc2c3e3d4e2163a8f8a0d3108f3e3ac8e93a0027518bf879542d13e5fe"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-023445-779d71a/marvel-linux-amd64"
    sha256 "4c9de35e963c422f998e8e363834e1c7a17f182a892969b403ac3938a20ea54d"
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

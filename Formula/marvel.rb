class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.043216.d8056ff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-043216-d8056ff/marvel-darwin-arm64"
    sha256 "c3e1d410ac28650b85210d1b3eead976b7094955879c0f61076918540f16a389"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-043216-d8056ff/marvel-darwin-amd64"
    sha256 "1de2a897b7eca0294228ea2c91c2a756172cde3dd94315251c9c3c201f7ca30e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-043216-d8056ff/marvel-linux-arm64"
    sha256 "d8ab08d5dd287a69e5b1bac464d8987214c21403d173d13787bd820088f529fb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-043216-d8056ff/marvel-linux-amd64"
    sha256 "598d5814db645369f1b55f91a2693954396f09065efc13c9345b732667f1ab32"
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

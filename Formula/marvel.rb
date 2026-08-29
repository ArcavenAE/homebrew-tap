class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.190353.98a9a2c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-190353-98a9a2c/marvel-darwin-arm64"
    sha256 "f3ea0fe549fa9d247ab85ec5363f66beefe9990111d4a1f8f181118edf0cd6e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-190353-98a9a2c/marvel-darwin-amd64"
    sha256 "19164612c9ccd52611c45bc9761d225f1940e45f4791992ceda74384ec1a91d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-190353-98a9a2c/marvel-linux-arm64"
    sha256 "f04a170787e21bf350307d2fb90b5c3ebe8fc51286369c4b2d1aea5ac16a3332"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-190353-98a9a2c/marvel-linux-amd64"
    sha256 "33975a8471ce8d52a425dbdb789485a43215ea0cd1de1823f809af958adcf603"
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

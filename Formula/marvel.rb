class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.031945.a2f298b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-031945-a2f298b/marvel-darwin-arm64"
    sha256 "81305f1cbe85ffb3566b4aad8679402289347eeaed10885c742322921e890da1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-031945-a2f298b/marvel-darwin-amd64"
    sha256 "2db68149d9b6545fd35f3bfc1a2380d0cd66cb8e1622f0f3e6c91d8b571b877d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-031945-a2f298b/marvel-linux-arm64"
    sha256 "a0804000f5d1933d75fe19f1101adb1a9cd5c45a42de2c453195d1bd73496aac"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-031945-a2f298b/marvel-linux-amd64"
    sha256 "ee45883f88428e2684865cbea380deb455b6406a6b78cb98082a427dd547130d"
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

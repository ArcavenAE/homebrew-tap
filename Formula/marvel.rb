class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.100355.c5ecca2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-100355-c5ecca2/marvel-darwin-arm64"
    sha256 "a2d30b66e248736892cc73e7c925ff08fa19cfd36c0742f0a0d6d6c09c704bd2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-100355-c5ecca2/marvel-darwin-amd64"
    sha256 "f474dfaa16f9f8765101d5752afd9fcb2dfb5feee9c3dc1c93479115a53d0b50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-100355-c5ecca2/marvel-linux-arm64"
    sha256 "f7a14c77ff0f31c9e4e9e8428ab9906c26db9bd508443bf6605e750f0f12d543"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-100355-c5ecca2/marvel-linux-amd64"
    sha256 "3763ed343c849974cbdbf6000673ef226c4bbaabe69182d95e60bce341f75869"
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

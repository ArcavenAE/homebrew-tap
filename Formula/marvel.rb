class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.031927.33fb22a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031927-33fb22a/marvel-darwin-arm64"
    sha256 "e302c5aeb3350a5dbb519330f2702aae0aa02141722f2ca0b0fed0912be32935"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031927-33fb22a/marvel-darwin-amd64"
    sha256 "cd789e5cdd5ccfc34b8bc1ed48350f8536a091d6332c1d6c9f87fbea81fe8473"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031927-33fb22a/marvel-linux-arm64"
    sha256 "6304556b071fe120d6f7c6180cc7ae39796565e3b405598f0e68fcbacdfc3696"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031927-33fb22a/marvel-linux-amd64"
    sha256 "374f0cdb4d54ba5785a4b7c4a683a412a0efc95210a338ed2fd5756f7e034aa8"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.073409.d1b9807"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-073409-d1b9807/marvel-darwin-arm64"
    sha256 "ac77a725a3c3674846b362973b2bab093a7398423d16a00b31b354b5bc2a0d65"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-073409-d1b9807/marvel-darwin-amd64"
    sha256 "0ab26f9650f8b9c760c7a063400935dff4df7aaa1d452e20c09deb644d88f989"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-073409-d1b9807/marvel-linux-arm64"
    sha256 "78b174cb64e03393b839a14ab243df7f17ec09706f4a10cdcc843097e5a8c6b3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-073409-d1b9807/marvel-linux-amd64"
    sha256 "145cc1d6854db2c26b1bffbf5aebaf444177e7fc932c3a1ce3b7c8b9e3befd38"
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

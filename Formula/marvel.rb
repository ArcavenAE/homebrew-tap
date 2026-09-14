class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.225000.44bf47b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-225000-44bf47b/marvel-darwin-arm64"
    sha256 "52358fcbd8d40914e715d1ca1731e7297675c639d76a61902454486ad8877d7e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-225000-44bf47b/marvel-darwin-amd64"
    sha256 "2c3e898dc2f5762866d530d597de6d4e525ef9f1053c0f0c1b0fc42fe79a61d5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-225000-44bf47b/marvel-linux-arm64"
    sha256 "c593a761590b8e71095fc8d1e69112578724885735df0597543c6ccdf882f6a3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-225000-44bf47b/marvel-linux-amd64"
    sha256 "14f763c283d151207a25dad18fdc3ccf8a27357e397121da2c853d1e5b2cae55"
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

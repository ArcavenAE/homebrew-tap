class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261128.024834.1e6eaed"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-024834-1e6eaed/marvel-darwin-arm64"
    sha256 "0a46e0a353b37fdb84d4ae45a92dc743e35170737624f15c2735f32ab90c1695"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-024834-1e6eaed/marvel-darwin-amd64"
    sha256 "c4131988554f14a05ad768c4e5c331aeeef5675f24707d80505c38ba443510a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-024834-1e6eaed/marvel-linux-arm64"
    sha256 "1d2ec05b030fd4e41dcbb015c6724778a9c8cebde10e9d9ec10419efb2990985"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-024834-1e6eaed/marvel-linux-amd64"
    sha256 "c67d710b33f1db5afefd287757d22ebf0cc0c369ea5d1663a1b2eaaebba3a1b0"
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

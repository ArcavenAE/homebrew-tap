class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.234924.6c29c96"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234924-6c29c96/marvel-darwin-arm64"
    sha256 "58186597dcf8a1bed966582d7f5f98250654495f836ddd29c38a1a39610006fa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234924-6c29c96/marvel-darwin-amd64"
    sha256 "1dabdddc8f1d84e6fa1f91440c7cbe503d94bb7f1a97d5d268aac4a3537ffc1a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234924-6c29c96/marvel-linux-arm64"
    sha256 "de5a8dbdca5ada517af4a381e5c1b2f374137f97c03cc3bba3a5cb14179abc39"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234924-6c29c96/marvel-linux-amd64"
    sha256 "8261bf8063ad5d62ebf2cfa3c9f33e3b902299c7033415dffebcd2dac2710346"
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

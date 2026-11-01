class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.212605.3c03d5c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-212605-3c03d5c/marvel-darwin-arm64"
    sha256 "8cc4262cb503f3b7e5d701d73170b5b5442897b335defb8b34deda60fce7232c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-212605-3c03d5c/marvel-darwin-amd64"
    sha256 "2ecfbfa945e1f1b12003a9444f9580fe1e75c89f309a27e595cf4e7813543860"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-212605-3c03d5c/marvel-linux-arm64"
    sha256 "12f59e408a28e6cfbbc10789dbdaf835cf067340c9db3cc03bcb1bbbb75101f8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-212605-3c03d5c/marvel-linux-amd64"
    sha256 "df012c26ee184599639b5222da6bbbd5e2068b27661cc029ad19c832732d9455"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.184050.65ac391"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184050-65ac391/marvel-darwin-arm64"
    sha256 "ac913bd2b15c7e219c9da83a69a34c052a237ac60ec3b1be7aa14a8649d31061"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184050-65ac391/marvel-darwin-amd64"
    sha256 "5f851b2ab8e05b799c8870ea8c76260d66abc08db47b42ec2590f33c837869d5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184050-65ac391/marvel-linux-arm64"
    sha256 "9dcf12fb2eb7a2e12ca2c857dca9dd1e6bc4c9d3a2b844fced738a6fc42c245f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184050-65ac391/marvel-linux-amd64"
    sha256 "276295f7d4a51f62abbeabe91afe0629fa20a3d6ed173c41bb8a5439c66198a5"
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

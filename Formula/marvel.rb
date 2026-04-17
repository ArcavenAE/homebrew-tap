class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.010848.70fbbba"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-010848-70fbbba/marvel-darwin-arm64"
    sha256 "652b8263c455cd3129bcd19fda32a21c97e750694c8c536f7879bac0c83a1d72"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-010848-70fbbba/marvel-darwin-amd64"
    sha256 "e37c621c846502d1f11413d774a901814dfa012e4631155621ade1e0b0e9e848"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-010848-70fbbba/marvel-linux-amd64"
    sha256 "c46b4094f683857e77f642c6b9540844e87e266862187a56087bdda7cc6c112f"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end

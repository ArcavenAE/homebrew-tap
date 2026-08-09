class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.092529.ec4a4d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-092529-ec4a4d9/marvel-darwin-arm64"
    sha256 "831ceb0e9eed180ae936e71af4f8a772f7d2f9da1274dd5f866c5970929aae46"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-092529-ec4a4d9/marvel-darwin-amd64"
    sha256 "71b70fe02842f95843d4f6d3c08bc2bc467726ab4b71dfe3d197567dce5681b7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-092529-ec4a4d9/marvel-linux-arm64"
    sha256 "725a41c5e2b5b80e1f370590afc3e87da9c1ef60cc8b9b29a4843d9910586675"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-092529-ec4a4d9/marvel-linux-amd64"
    sha256 "606d0d4e37490ab6ef2ca22424809bafacf75d3572231989e3e89f5bac58568c"
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

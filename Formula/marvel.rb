class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261005.003628.7d1e5ef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-003628-7d1e5ef/marvel-darwin-arm64"
    sha256 "5d78ab664eb89c309af0e9f671fdad035d0956750dc850ac43ab3da6aa604a75"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-003628-7d1e5ef/marvel-darwin-amd64"
    sha256 "ca0ee21c03fc8c54d234fa645f7f004e69cab27bb3f460280effbd0e722918b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-003628-7d1e5ef/marvel-linux-arm64"
    sha256 "89e0e9d37de1ac1c3552d9575808daad5b9df0c6de46b2b975896fc259a81d38"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-003628-7d1e5ef/marvel-linux-amd64"
    sha256 "393858b8510ad32ea44d39578c8e980bf39b2f9f23b638412a43785ce2bfc103"
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

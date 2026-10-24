class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261024.230143.7c4a3d3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230143-7c4a3d3/marvel-darwin-arm64"
    sha256 "c89ef4d877aa5e1d9c0816e743e6c1fd02d25ec97ed0d26fa78de2922e16c87f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230143-7c4a3d3/marvel-darwin-amd64"
    sha256 "032779bd131fac8ea9d758326d9fe0a34d537de251d6b912513ef2ae0446de1c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230143-7c4a3d3/marvel-linux-arm64"
    sha256 "bbfb68a63b8362d4cc7d8db19afe7e2f878a59c66247c2d20ae24e298b465395"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230143-7c4a3d3/marvel-linux-amd64"
    sha256 "05d886a2332faeb637e4b793fa0acba487343e1123de635bc1fe0a89b6e4bcb7"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260918.015907.2798ab7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-015907-2798ab7/marvel-darwin-arm64"
    sha256 "4e4d764bf8d5611559a24330d5625d370545bae430c10f90174453cab194a161"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-015907-2798ab7/marvel-darwin-amd64"
    sha256 "0244f249204c700cce03b9d07e8ba2e936ce3999a0cc742b8eedbbe4b4c7c1cd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-015907-2798ab7/marvel-linux-arm64"
    sha256 "be85859148c7a3ab8a8c6e43a73e4b29f07dbb887c8121a8f7415acfc7103376"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-015907-2798ab7/marvel-linux-amd64"
    sha256 "e00f49162a5c2a9422a8626b3759e7f80163e9ca3d8d749ffcccbbce7c8207cb"
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

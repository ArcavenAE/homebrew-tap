class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.030532.7593f69"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-030532-7593f69/marvel-darwin-arm64"
    sha256 "9d73c2e02054a4b8bd48c605a6a1309bafbc668ec0ba2b52365c30e0bc5a75e0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-030532-7593f69/marvel-darwin-amd64"
    sha256 "59bb7384a2146b6e08e391b33754e0d0552fcbcc9752da5583258d2d0257b573"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-030532-7593f69/marvel-linux-arm64"
    sha256 "8741887829bba52e5850a0665af76c252d8662a9c0b2b1a6b90053928186c2a3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-030532-7593f69/marvel-linux-amd64"
    sha256 "7be42959c091aa2f90e9473ebb031149ee646da5bbb74c97c4a70be7c266221c"
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

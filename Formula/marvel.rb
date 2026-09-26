class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.184031.b3b8271"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184031-b3b8271/marvel-darwin-arm64"
    sha256 "0a45df286d9b5ff6939f8708fee174d626f09ce7b99cad8739830cd4e77ce3d3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184031-b3b8271/marvel-darwin-amd64"
    sha256 "0b37ec21134c08925cd7fb48d32b6f6e33387887f1276935b2b6634bb4dac147"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184031-b3b8271/marvel-linux-arm64"
    sha256 "aeef7fe7dce79f119399baa0d17ceb82220952caafb2cd95a753d2bebbb2cf4d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-184031-b3b8271/marvel-linux-amd64"
    sha256 "2075d63a7d697fbb40457b711b6f425044cb223f4fbb3bf68e344732ff61fa07"
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

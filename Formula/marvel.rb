class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.174929.64bf046"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-174929-64bf046/marvel-darwin-arm64"
    sha256 "8cf7a7449b6de4a3dcbd74648d67c978bde9715da082b36be8f80f4df086478f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-174929-64bf046/marvel-darwin-amd64"
    sha256 "e2f26d7e7a4a221237f59290ee4cc05dba9470f51b9228a676526aadd84a4151"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-174929-64bf046/marvel-linux-arm64"
    sha256 "d2f17bb028bdf192418bec3634e1ff5c966ca0a3e34c389e3dab3b72a0e7f71c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-174929-64bf046/marvel-linux-amd64"
    sha256 "97f31fe4500260bf6328dc6d73f9c77a2dc6b39a84984ef79b807dd279d05c73"
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

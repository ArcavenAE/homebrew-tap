class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.014045.7194d39"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014045-7194d39/marvel-darwin-arm64"
    sha256 "3aa9002583627f5bb2a9f2a60b5e5dd511a1065923e2125676bc8c0826b4355e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014045-7194d39/marvel-darwin-amd64"
    sha256 "673d10afa78a1ab6f4c4ea3af8411ba77718dd8ae072b890bcbf78a3334ca427"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014045-7194d39/marvel-linux-arm64"
    sha256 "864cf4c463bef557b77a8d3eee853a9299ed1a71a775ebd080fc38a7640544f4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014045-7194d39/marvel-linux-amd64"
    sha256 "632b2bc46f406c2a42c641263ddf1883c8dbf6f086c5a5f909749c54e3c018ae"
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

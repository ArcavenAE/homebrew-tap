class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.223611.2d10cc0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223611-2d10cc0/marvel-darwin-arm64"
    sha256 "e285e2892ae302b01001bb63465dfa1cc29e7e1ab28e42c83050395c31fb4811"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223611-2d10cc0/marvel-darwin-amd64"
    sha256 "9a9a7adfc782d7e3f5060b1076f52c6b9a564b33b24fe5f21df30f562a562f39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223611-2d10cc0/marvel-linux-arm64"
    sha256 "d0262f8fc15d96f3b3a6d66a1fd29d829c3247cfab579992be7bed721112b778"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-223611-2d10cc0/marvel-linux-amd64"
    sha256 "a19e3d3db2435d23bd152ea4be8be98a2180cc3b0d5b7c4c57421e496adff11f"
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

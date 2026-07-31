class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.232241.ee4fec2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232241-ee4fec2/marvel-darwin-arm64"
    sha256 "2608b1a4bf9f88b7539dcea93a802bf3b12288ee96faaba6db9dbe30b631af99"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232241-ee4fec2/marvel-darwin-amd64"
    sha256 "b57d014965609f62f4ab97175a1f7ec561485fd2fe9fe66f687860c0fa567426"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232241-ee4fec2/marvel-linux-arm64"
    sha256 "cb08f03e8c981c8f1db9de887b403537a25fe1970f469fb9f8585f686e0a3209"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232241-ee4fec2/marvel-linux-amd64"
    sha256 "512fa7c955665b7fc233189ce509350a9b8ccebc262f1f22244fbe05a5b32a24"
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

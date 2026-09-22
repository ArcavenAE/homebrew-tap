class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260922.034941.a517e47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-034941-a517e47/marvel-darwin-arm64"
    sha256 "d50220c2ad0ee6921e2bff73f797a935ca5168cbfac36792e7361b9a624d7335"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-034941-a517e47/marvel-darwin-amd64"
    sha256 "e4e685c1d68d8ea57338f5fb83e778f4f6b76f2ace9b3dd23e56bff0ebe2cd2d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-034941-a517e47/marvel-linux-arm64"
    sha256 "0a7a73a651bcb6d60ad31d770b0af0f87f2a9ea3d469e9da89b0d2cda3e4f327"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-034941-a517e47/marvel-linux-amd64"
    sha256 "4ed3964387675cc4f0eeabad8969155e5d14a69c4200fa5152a2257821bcc6f9"
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

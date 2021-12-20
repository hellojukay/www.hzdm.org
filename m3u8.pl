#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
binmode(STDOUT, "encoding(UTF-8)");

foreach my $index (1...32) {
    my $url = sprintf " https://www.hzdm.org/bofang/74567-1-%d.html", $index;
    my $html = `curl -s $url`;
    my $title = sprintf "第%02d集", $index;
    my $m3u8;
    if($html) {
        if($html =~ m/"url":"(http.*?.m3u8)"/){
             $m3u8 = $1;
        }
        # 去掉反斜杠
        if($m3u8) {
            $m3u8 = $m3u8 =~ s/\\//gr;
        }
        printf "%s\t%s\n", $m3u8, $title;
    }
}
